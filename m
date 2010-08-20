Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmWsa-00031f-Q2
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 19:03:55 +0000
Message-ID: <4C6ED184.1030406@broadcom.com>
Date: Fri, 20 Aug 2010 12:03:32 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Jon Povey" <jon.povey@racelogic.co.uk>
Subject: Re: [PATCH] nanddump: Fix hexdump nybble ordering
References: <1282291879-28754-1-git-send-email-jon.povey@racelogic.co.uk>
In-Reply-To: <1282291879-28754-1-git-send-email-jon.povey@racelogic.co.uk>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2010 01:11 AM, Jon Povey wrote:
> Hex dumps were being printed with the nybbles reversed since
> commit 6ff458433ba15b8a7cb258ce64e64e98982df26e
> Fix.

Haha, wow. I'm pretty sure that when porting the kernel function over, I 
noticed that, then promptly ignored it. Good catch!

Thanks,
Brian
