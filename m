Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu22z-00030u-5Q
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 16:36:01 +0000
Message-ID: <547752D1.6040000@nod.at>
Date: Thu, 27 Nov 2014 17:35:29 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
References: <1416835236-25185-1-git-send-email-richard@nod.at>		
 <1416835236-25185-4-git-send-email-richard@nod.at>	
 <1417102739.5858.112.camel@sauron.fi.intel.com> <54774C71.50807@nod.at>
 <1417105793.5858.117.camel@sauron.fi.intel.com>
In-Reply-To: <1417105793.5858.117.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.11.2014 um 17:29 schrieb Artem Bityutskiy:
> On Thu, 2014-11-27 at 17:08 +0100, Richard Weinberger wrote:
>>> Obviously, there is some misunderstanding. This looks like lack of
>>> separation and misuse of layering. I am missing explanations why I am
>>> wrong...
>>
>> So you want me to use the UBI WL background thread for the scheduled fastmap work?
> 
> No. It is more like either use it or do not use it.

Sorry, I don't understand.
What do you want to do to?

>> I didn't do it that way because you said more than once that fastmap is fastmap and
>> WL is WL. Therefore I've separated it.
> 
> And "separated" meaning adding this code to wl.c?
> 
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +       flush_work(&ubi->fm_work);
> +#endif
> 
> Could it be separated some more then?
> 

Of course, commit "UBI: Move fastmap specific functions out of wl.c" does.
But this commit is *bugfix* commit.

Thanks,
//richard
