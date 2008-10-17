Received: from smtp6-g19.free.fr ([212.27.42.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqfFw-0006hz-9X
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 02:40:00 +0000
Message-ID: <48F7FAFF.7040902@free.fr>
Date: Fri, 17 Oct 2008 04:39:59 +0200
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD] cfi_cmdset_0002.c: Add Macronix CFI V1.0	TopBottom
	detection
References: <1223589342.3354.11.camel@linuxvideo.moore.hd.free.fr>
	<1223978975.6770.762.camel@macbook.infradead.org>
In-Reply-To: <1223978975.6770.762.camel@macbook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse a écrit :
> On Thu, 2008-10-09 at 23:55 +0200, Christopher Moore wrote:
>   
>> This patch adds TopBottom detection for most Macronix chips with CFI
>> V1.0.
>>     
>
> patching file drivers/mtd/chips/cfi_cmdset_0002.c
> patch: **** malformed patch at line 101: CFI V1.0
>
> Did you not test this after you received it back from the list?
>   

(Wiping egg off face) Please accept my apologies; I am afraid that the
line must have been wrapped by the mailer I used  :( 

I ran checkpatch.pl on the patch before sending it.
I even sent the patch to myself first.
The worst is that I did notice that some lines were wrapped to about 72
columns.
However as I had previously used the same mailer to send patches to
other people and to the LAK mailing list without problems, I figured
that the wrapping was happening at the receiving end.
With the intention of improving the presentation for others using the
same mailer, I even modified the commit comment part, which I had
written in 80 columns, down to 72 columns and tried again.

I have now experimented with "git send-email" and the result seems clean
so I shall use this in the future. The only thing that I am now worried
about is getting the headers right so that I do not break the thread.

I shall try sending the patch again later and I apologize in advance in
case it breaks the thread  :( 

Sorry again for wasting your time.

Cheers,
Chris
