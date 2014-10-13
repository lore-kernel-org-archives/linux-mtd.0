Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdgl7-0005U9-E9
 for linux-mtd@lists.infradead.org; Mon, 13 Oct 2014 14:38:02 +0000
Message-ID: <543BE21F.5020504@nod.at>
Date: Mon, 13 Oct 2014 16:30:55 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>		
 <1412029248-22454-4-git-send-email-richard@nod.at>	
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>
 <1413206263.7906.18.camel@sauron.fi.intel.com>
In-Reply-To: <1413206263.7906.18.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 13.10.2014 um 15:17 schrieb Artem Bityutskiy:
> On Fri, 2014-10-03 at 21:06 +0200, Richard Weinberger wrote:
>> Fastmap needs basically access to all internal state of UBI, which
>> lives mostly
>> within wl.c
> 
> Sounds like a very strong assertion, smells a bit fishy, need the
> details.

Fastmap need to know the exact state of each PEB.
I.e. is it free, used, scheduled for erase, etc...

>> It needs to iterate over the used, free, erase, scrub RB-trees, the
>> protection queue, etc. to
>> collect the exact state of all PEBs.
> 
> When? In 'ubi_write_fastmap()' when forming the FM pool data structures?

Yes.

> I think you can just add a function like this to wl.c:
> 
> int ubi_wl_get_peb_info(int pnum, struct ubi_wl_peb_info *pebinfo)
> 
> Yoy will give it the PEB number you are interested in, it will return
> you the information you need in 'pebinfo'. The information will contain
> the EC, the state (used, free, etc).
> 
> If you need just the EC, then you do not even need the ubi_wl_peb_info
> data structure.
> 
> Then you just iterate over all PEBs and fill the FM pool data
> structures.
> 
> Would something like this work?

The interface would work but some work in wl.c is needed.
For example if I want to find out in which state PEB 1 is wl.c would have to
look int free free, used free, protection queue, etc.. to tell me the state. This is slow.

But we could add the state information to struct ubi_wl_entry by adding a single integer attribute called "state" or "flags".
Then wl.c can set the state every time the PEB moves between internal data structures.
I.e. upon it moves from the used to free rb tree the flag UBI_STATE_FREE will be cleared and UBI_STATE_USED set.
This will also give us a very efficient way to ensure a sane state.
In fact, I have already written such a feature. I needed it to hunt down a Fastmap bug which lead to a state where a PEB existed
in both the used tree and the protection queue. Using the ->state attribute in ubi_wl_entry I was able to add various
cheap asserts to the code and found the incorrect transaction.

The cost of this bloating the ubi_wl_entry struct by sizeof(int) bytes.
But we'll get very efficient variants of self_check_in_wl_tree() and friends.

Also the implementation of ubi_wl_get_peb_info() would be easy.
It will be mostly like:
int ubi_wl_get_peb_info(int pnum, struct ubi_wl_peb_info *pebinfo)
{
...
e = ubi->lookuptbl[pnum];
fill_pebinfo(pebinfo, e->state);
...
}

Would this make you happy? :)

Thanks,
//richard
