Received: from hardrain.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19a1jK-0006Ou-Pm
	for <linux-mtd@lists.infradead.org>; Wed, 09 Jul 2003 00:18:39 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "gjx" <marchguo@yahoo.com.cn>,
	linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Date: Wed, 9 Jul 2003 11:21:53 +1200
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
In-Reply-To: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
MIME-Version: 1.0
Message-Id: <20030708231846.7C10B4431@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: nand flash driver
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 July 2003 14:33, gjx wrote:
> hi,linux-mtd
>
> 	 The hardware designer connects the control pins(CLE、ALE、R/B) of nand
> flash to the data bus, The CE、WE、RE pins to corresponding pin of CPU.
> Nedd I get the address of control pins? separate the data from data bus?
> How to implement controlling of nand.   Please give me some advice, thanks!

R/B is an open collector that is driven from the NAND. You should not be 
connecting this to the address bus. You can just leave this unconnected (R/B 
detection not available) or connect it to a GPIO.

I think most people connect CLE and ALE to GPIO pins, but some application 
notes describe driving these via the address bus. you should then be able to 
drive the lines the way you want by accessing the corresponding addresses.

-- CHarles
