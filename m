Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSch8-0004FG-M8
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 23:22:51 +0000
Message-ID: <4FAC4DC9.2050901@grid-net.com>
Date: Thu, 10 May 2012 16:22:49 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: ubifs_jnl_update and extended attribute inode removal
References: <4FAB33B2.80104@grid-net.com> <1336624262.1936.27.camel@brekeke>
In-Reply-To: <1336624262.1936.27.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/09/2012 09:31 PM, Artem Bityutskiy wrote:
> On Wed, 2012-05-09 at 20:19 -0700, Subodh Nijsure wrote:
>> Easy way to describe this is: I create 100 files, assign then extended
>> attribute, and remember what the xattr was, it always stays the same.
>> However now if I delete some of these files randomly some of the files
>> end up having wrong xattr.
> I guess this happens only when you do a power cut? I need to look
> closer, but quick feed-back is that there is probably a bug in the
> journal reply - when we see a deleted inode in the journal - we remove
> it from TNC, and we probably forget to look-up for all its xattrs?
> Really need to look closer.
>
> Would you prepare a description how I could reproduce this?
I re-submitted patches for integck and as well as v3 of extended 
attribute patch set that I have been holding on to.

You can just run integck -p -n 2 <dir-name> and that should  reproduce 
the issue i.e. integck will fail.

If email thread gets too long I could get on the OFTC #mtd irc chat at 
time that works best, to get some guidance.

/Subodh
