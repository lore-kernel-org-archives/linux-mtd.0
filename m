Received: from mail-oln040092000013.outbound.protection.outlook.com
 ([40.92.0.13] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1epBCN-0007c7-6A
 for linux-mtd@lists.infradead.org; Fri, 23 Feb 2018 11:07:32 +0000
From: Bean Huo <beanhuo@outlook.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, beanhuo <beanhuo@micron.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v1 1/3] mtd: physmap: add dual die entry in devicetree
 binding
Date: Fri, 23 Feb 2018 11:07:17 +0000
Message-ID: <DM2PR12MB0014BEF2B19FED0392EB0366A6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB001463BD62775C388AEBFD3FA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>,
 <20180222140542.47340842@bbrezillon>
In-Reply-To: <20180222140542.47340842@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,=0A=
thanks for the review.=0A=
=0A=
>> + - dual-die-stack: boolean to enable support for the devices with the=
=0A=
>> +   two dies in stack.=0A=
=0A=
>How about making that more future proof and adding a property that=0A=
>directly contains the number of dies (num-dies)?=0A=
=0A=
Exactly, I also thought here should add a property, through which it can be=
 compatible=0A=
with all kinds of PNOR for the future more dies stacked device.=0A=
But currently, it doesn't exist  PNOR device with more than two dies, and w=
e=0A=
have no idea about 4/6 dies stacked device operation sequence. so I simply =
add a boolean=0A=
entry and try to only enable dual-die stacked PNOR firstly.=0A=
=0A=
Maybe I can try to do that in next version patch. the software implementati=
on is so flexible.=0A=
=0A=
>>=0A=
>>  For JEDEC compatible devices, the following additional properties=0A=
>>  are defined:=0A=
=0A=
