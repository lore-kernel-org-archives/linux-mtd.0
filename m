Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqRc4-0000oR-Jv
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 06:29:12 -0400
Message-ID: <4652C5EB.7080007@indefia.com>
Date: Tue, 22 May 2007 13:28:59 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: "Vladimir A. Barinov" <vbarinov@ru.mvista.com>
Subject: Re: Generic Platform NAND Driver
References: <464D98DF.5020004@indefia.com> <4652B321.90006@indefia.com>
	<4652BC51.9090009@ru.mvista.com>
In-Reply-To: <4652BC51.9090009@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vitalywool@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vladimir A. Barinov wrote:
> You can look at the first (I guess) usage example here:
> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4385/2
>
>   

+ixdp425_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *this = mtd->priv;
+	int offset = (int)this->priv;

Here offset is read from nand_chip->priv, which actually points to struct plat_nand_data of plat_nand.c

Am I wrong ?
