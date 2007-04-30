Received: from beaver.sibername.com ([64.15.155.210])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HiVeo-0005FI-L4
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 09:11:14 -0400
Received: from [24.139.16.154] (helo=[192.168.12.100])
	by beaver.sibername.com with esmtpa (Exim 4.63)
	(envelope-from <thraxisp@logicaloutcome.ca>) id 1HiVem-0005MW-A5
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 09:11:08 -0400
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <200704281324.50082.florian.fainelli@telecomint.eu>
References: <200704281324.50082.florian.fainelli@telecomint.eu>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <C7B3B39B-93F7-4210-99F9-5A9920542C52@logicaloutcome.ca>
Content-Transfer-Encoding: 7bit
From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Subject: Re: Finding ERASE_INFO from a Flash datasheet
Date: Mon, 30 Apr 2007 09:09:57 -0400
To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


On 28-Apr-07, at 7:24 AM, Florian Fainelli wrote:

> Hello all,
>
> I am using a box which has a SST 39VF6402B flash [1] driven by  
> jedec. This
> flash is not yet referenced in the Linux kernel, and once I got the  
> right
> erase informations, I will submit a patch to add it.
>
> For the moment, I have defined 4 strictly identical erase  
> informations :
> ERASE_INFO(0x2000, 256), which makes me avoid this message "Sum of  
> regions
> (400000) != total size of set of interleaved chips (800000)". I am  
> pretty
> sure these informations are completely wrong.

   I'm using 6401B devices, but configured for both. I have 8 regions  
configured as ERASE_INFO(0x1000, 256).

   It should be noted that the SST part has two erase modes: 4k and  
64k blocks. If you want to use the small block erase mode, you will  
need to change the erase command from an 0x50 to 0x30.

   I can provide a patch for the 2.4.27 kernel if you are interested.

>
> If anyone has some clues about this, I will be glad finishing my  
> patch ;)
>
> Thank you very much in advance.
>
> [1] : http://www.sst.com/downloads/datasheet/S71288.pdf

- --
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGNerqCf55IxAEBfkRAshYAJ49ZJYUVK+sEIoiSJeCTMrX4/TkRQCgnhj/
fQ3yQAjcr7vvRT8ZIgw7LGg=
=jpzm
-----END PGP SIGNATURE-----
