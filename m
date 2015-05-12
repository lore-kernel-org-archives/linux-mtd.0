Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ys94H-0004TU-23
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 12:13:49 +0000
Received: by labbd9 with SMTP id bd9so4103455lab.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 05:13:26 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Jfs-discussion] [PATCH] fs: cleanup slight list_entry abuse
References: <1426764485-13637-1-git-send-email-linux@rasmusvillemoes.dk>
 <550AF51C.9000600@plexistor.com> <550AFF79.1030105@oracle.com>
Date: Tue, 12 May 2015 14:13:25 +0200
In-Reply-To: <550AFF79.1030105@oracle.com> (Dave Kleikamp's message of "Thu,
 19 Mar 2015 11:55:21 -0500")
Message-ID: <87mw1a6lju.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: codalist@TELEMANN.coda.cs.cmu.edu, Boaz Harrosh <boaz@plexistor.com>,
 jfs-discussion@lists.sourceforge.net, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Dave Kleikamp <dave.kleikamp@oracle.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 19 2015, Dave Kleikamp <dave.kleikamp@oracle.com> wrote:

> On 03/19/2015 11:11 AM, Boaz Harrosh wrote:
>> On 03/19/2015 01:28 PM, Rasmus Villemoes wrote:
>>> list_entry is just a wrapper for container_of, but it is arguably
>>> wrong (and slightly confusing) to use it when the pointed-to struct
>>> member is not a struct list_head. Use container_of directly instead.
>>>
>>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>>> ---
>>> Most of these predate git. If I'm the only one who has been confused
>>> by this in 10 years, maybe it's not worth the churn.
>>>
>> 
>> No you are not alone here. I have seen this once as well but did not have
>> the gumption to send a fix. (The sysv.h one)
>> 
>> I totally agree with this patch. (So many of them, bread crumbs of copy/paste
>> for you ;0)
>
> I'm sure that was the case with jfs.
>
>> 
>> Reviewed-by: Boaz Harrosh <boaz@plexistor.com>
>
> Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>

Al, any chance you'd take this through the vfs tree?

Rasmus
