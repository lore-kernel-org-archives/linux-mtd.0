Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7Cww-0001VG-GD
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 08:34:39 -0500
Message-ID: <422863D9.6010109@ieee.org>
Date: Fri, 04 Mar 2005 08:34:17 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: andrew box <andr3wbox@gmail.com>
References: <66f646fd05030323395ed3a52c@mail.gmail.com>
In-Reply-To: <66f646fd05030323395ed3a52c@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: differences between NFTL and INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

andrew box wrote:
> I have a diskonchip2000dip(NFTL) with jffs2,and I want to use it as a
> boot device,while docboot just support INFTL now...that is the reason
> why I want  to know the difference between them.

The DOC2000 parts that use INFTL have a different controller chip 
(derived from the one used in the DOC Millennium, rather than the one in 
the original NFTL-based DOC2000).  The register locations, command 
sequences, etc. are all slightly different.

Also, the boot loader in the NFTL-based parts' ROM does things a bit 
differently from the way it works on the INFTL parts.

Having said all that, the differences are well understood and would only 
affect small portions of docboot.  The task of porting docboot to the 
NFTL-based parts should not be large.

All we need is a volunteer :)

	-Dan
