Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TQw5g-0007wL-QL
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 08:13:29 +0000
In-Reply-To: <50877953.9040602@linux.vnet.ibm.com>
References: <50877953.9040602@linux.vnet.ibm.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
Subject: Re: [question]MTD:unstable bit issues?
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
Date: Wed, 24 Oct 2012 10:13:02 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jia:

> ----------------------------------------------------- 
> 2)a 4k bytes hole with all 0 in the flash file.
> -----------------------------------------------------
> -original-file DD AF C8 EE 57 EB 84 CE A1 7F B1 38 E7 22 51 2F
> -    94 AE 77 5B 48 EA 61 8C 09 BB C5 74 6E B1 87 D2 
> -    A9 32 8D 2A E7 7F D2 C3 DB 1A 92 E7 66 7C B8 4E 
> ......
> 
> +file-in-flash 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
> +    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
> ......
> -----------------------------------------------------

We have also seen this "4k zeros" issue for some time. I never found out 
was was happening because the issue was suddenly no longer reproducible. 
:-(

In our case, though, we didn't have NAND flash, but JFFF2 with serial NOR 
flash. So I would guess that this is not a NAND problem.

Which file system do you run? Is it JFFS2?

Best regards,
Thomas
