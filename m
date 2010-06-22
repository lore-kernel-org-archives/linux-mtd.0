Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OQykp-0003gX-O7
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 08:22:48 +0000
Message-ID: <4C2075BE.3000000@windriver.com>
Date: Tue, 22 Jun 2010 16:35:10 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: "Stanley.Miao" <stanley.miao@windriver.com>
Subject: Re: [PATCH v3] Fix mtd-utils bugs
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any other comments ?

Stanley.

Stanley.Miao wrote:
> Changes from V2:
> 1, Get the linux version via uname() according to Joakim Tjernlund.
> 2, Set the default version the latest version according to Joakim Tjernlund.
>
> The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
> is not enough for many big NAND chips. Therefore, this structure is replaced
> by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
> Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
>
> Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
> keep compatible with the old linux kernel, a linux version detection function
> is added.
>
> YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
> "forcejffs2", "forceyaffs" anymore. Now clean them up. 
>
>
> Stanley.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
