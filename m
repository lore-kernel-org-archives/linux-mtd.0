Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fgXK-00084m-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 13:21:22 +0000
Received: from lin01.mn-logistik.de (frdb-d9b95969.pool.mediaWays.net [217.185.89.105])
	by mail05.iok.net (8.12.5/8.12.5) with ESMTP id h13DLGcw006717
	for <linux-mtd@lists.infradead.org>; Mon, 3 Feb 2003 14:21:18 +0100
Received: from mnz66.mn-logistik.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with ESMTP id 916001FF22
	for <linux-mtd@lists.infradead.org>; Mon,  3 Feb 2003 13:47:56 +0100 (CET)
From: Holger Schurig <h.schurig@mn-logistik.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 3 Feb 2003 13:47:56 +0100
References: <3E3E517F.9010908@laser5.co.jp>
In-Reply-To: <3E3E517F.9010908@laser5.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200302031347.56205.h.schurig@mn-logistik.de>
Subject: Re: help: bootloader for loading kernel from mtdblock device on flash........
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>   I am a mtd newbie, and have been assigned the task of writting a boot
> loader 

Use an existing one and adapt it, see for example into eCos/Redboot or into 
u-boot.sourceforge.net.
