Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CjVGe-0005wq-9k
	for linux-mtd@lists.infradead.org; Tue, 28 Dec 2004 23:17:03 -0500
Message-ID: <002a01c4ed5d$70a92050$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: "Vikrant_Basotra" <Vikrant_Basotra@Satyam.com>,
	<linux-mtd@lists.infradead.org>
References: <3D9FDCA910DD4445896A0BE5ECF009D40212F050@bla.satyam.com>
Date: Wed, 29 Dec 2004 09:48:14 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: S29GL064M90 flash memory driver required
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Usually mtd drivers are available in \usr\src\linux<kernel 
version>\drivers\mtd\chips.
I guess the amd driver available there shall work.

Regards,
Subrahmanyam.

----- Original Message ----- 
From: "Vikrant_Basotra" <Vikrant_Basotra@Satyam.com>
To: <linux-mtd@lists.infradead.org>
Sent: Tuesday, December 28, 2004 06:13 PM
Subject: S29GL064M90 flash memory driver required


> Hi All,
> I am using Spansion's S29GL064M90 flash memory (CFI Compatible) on
> mpc8248 based board. I need the linux driver for this flash memory, can 
> any
> one guide me from where I could get the driver for this Flash Memory or if
> some one has a driver which can work with this flash, please do send the
> code.
> Regards,
> Vikrant Basotra
> **************************************************************************
> This email (including any attachments) is intended for the sole use of the
> intended recipient/s and may contain material that is CONFIDENTIAL AND
> PRIVATE COMPANY INFORMATION. Any review or reliance by others or copying 
> or
> distribution or forwarding of any or all of the contents in this message 
> is
> STRICTLY PROHIBITED. If you are not the intended recipient, please contact
> the sender by email and delete all copies; your cooperation in this regard
> is appreciated.
> **************************************************************************
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
