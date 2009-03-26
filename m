Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lmp81-0003zR-3Z
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 12:56:19 +0000
Received: by bwz3 with SMTP id 3so566038bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Mar 2009 05:56:10 -0700 (PDT)
Message-ID: <49CB7AEA.2000009@gmail.com>
Date: Thu, 26 Mar 2009 14:54:02 +0200
From: Darius Augulis <augulis.darius@gmail.com>
MIME-Version: 1.0
To: massimo cirillo <maxcir@gmail.com>
Subject: Re: [PATCH] Fixup for Numonyx M29W128 chips
References: <62cbdcd90903260402q61725160v7f1538762fbd76bc@mail.gmail.com>
In-Reply-To: <62cbdcd90903260402q61725160v7f1538762fbd76bc@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm getting jffs2 errors after write to flash. I don't have the output 
log now, but the idea is that after write to flash, jffs2 does not find 
magic numbers anymore. File system is broken.
It's completely resolved when write buffers are not used. I could make 
patch which disables write buffer only for M29W128 chips. Anyway it's 
not working, one who needs more performace, is welcome to fix this in 
better way...

Darius.

massimo cirillo wrote:
> Hi Darius,
> what kind of failure did you experiment with M29W?
>
> In my opinion, complete removal of the buffer program feature is not a
> good solution,
> because you are taking away an important feature of the device, that results in
> a very high performance decrease.
>
> Moreover, if you make the fix applicable to all devices with 0x227E device ID,
> you are removing the same feature from other devices too, such as M29EW
> that has a much bigger buffer thus resulting in a dramatic performance decrease
> for this device.
>
>   
