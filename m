Received: from mail4.asianet.co.th ([203.144.222.217] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGwUT-0003Yl-Qu
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 05:01:31 -0500
Received: from virscan2.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.198]) (envelope-sender <jay4mail@yahoo.com>)
	by mail4.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 31 Mar 2005 16:54:47 +0700
Message-ID: <424BC8E0.30200@yahoo.com>
Date: Thu, 31 Mar 2005 16:54:40 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: m.mikolaiczyk@rac.de
References: <424BBDE3.4000506@rac.de>
In-Reply-To: <424BBDE3.4000506@rac.de>
Content-Type: text/plain;
	charset=TIS-620;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND connected with address lines based example
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marcus Mikolaiczyk wrote:
> Dear list users,
> 
> I got a system where a Samsung NAND ist connect  via Adresslines (A0 ->
> CLE, A1 -> ALE) using a chipselect from the processor. I looked through
> the guide "MTD NAND Driver Programming Interface" and the sources to
> adapt an existing driver. Now I stuck with a problem concerning the
> board_hwcontrol function.
> It's alwas there that CLE/ALE have a set and a clear command. But in my
> setup the CLE/ALE setting is made through the access of the
> addresslines. See the table:
> 
>         A1(ALE)   A0(CLE)  Beispieladresse    Funktion
> -------------------------------------------------------------------------------
> 1         0         0       0xA8000000        read/write access on mem
> 2         0         1       0xA8000001        Command
> 3         1         0       0xA8000002        Addresssetting
> 4         1         1       0xA8000003        not valid
> 
> The base is A8000000 for example.
> Now writing a Byte to 0xA8000001 (a NAND command) automatically sets ALE
> =0 and CLE=1
> Writing the addressparts is done through writing the 1st databyte Col1
> to address 0xA8000002 and so on.
> Concerning now the function board_hwcontrol there is the
> ...
> switch(cmd) {
> 		case NAND_CTL_SETCLE: /* Write to addr 0xA8000001 */;break;
> 		case NAND_CTL_CLRCLE: /* do nothing */;break;
> 		case NAND_CTL_SETALE: /* Write to addr 0xA8000002 */;break;
> 		case NAND_CTL_CLRALE: /* do nothing */;break;
> }
> ...
> Am I right when these commands have to be empty in this case?
> Where do I tell the system to use the address 0xA8000001 for commands
> and 0xA8000002 for addresses?
> 
> Kind Regards
> 
> Marcus

You could do something like this I suppose.

struct nand_chip *this = mtd->priv;
switch(cmd) {
	case NAND_CTL_SETCLE: this->IO_ADDR_R = this->IO_ADDR_W = 0xA8000001; 
break;
	case NAND_CTL_CLRCLE: this->IO_ADDR_R = this->IO_ADDR_W = 0xA8000000; 
break;
}

That what I'd do.

Regards,
Pathompong Puengrostham
