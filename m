Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IEJZ-0005AS-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2001 19:57:26 +0100
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA0A3B8B@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: 'Holger Schurig' <h.schurig@mn-logistik.de>,
	linux-mtd@lists.infradead.org
Subject: RE: chip identification help?
Date: Thu, 5 Jul 2001 14:01:19 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

The JPEG doesn't look like a typical Flash device. Too many pins. I'd get
some Flash data sheets, check the package styles and consider only those
parts on the board whose packages are consistent with what's shown in the
documentation. I've seen "undocumented" part numbers from TI before, but the
package style was consistent with other chips of the same type (in this case
x16 EDO DRAM chips). Most Flash chips are in the TSSOP package.

-> -----Original Message-----
-> From: Holger Schurig [mailto:h.schurig@mn-logistik.de]
-> Sent: Thursday, July 05, 2001 9:33 AM
-> To: linux-mtd@lists.infradead.org
-> Subject: chip identification help?
-> 
-> 
-> Hi all!
-> 
-> I have a board where I don't have the slightest idea what the flash 
-> chip might be. Is there any web site that can help me idenfity it?
-> 
-> 
-> The candiate I have in my eye is a square SMD chip with pins on all 
-> four sites. The print says:
-> 
-> D11644PBK
-> F646501A
-> # FA 0BAKLNW
-> 
-> The "#" sign stands for the Texas Instruments logo.
-> 
-> No, a search on TI's website for 11644, D11644, F646501, 64F6501 etc 
-> did not reveal any information on flash chips :-(
-> 
