Received: from mout01.kundenserver.de ([195.20.224.132])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RE8U-00042d-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2001 15:35:10 +0100
Message-ID: <3B6571F2.6258156D@jurca.de>
Date: Mon, 30 Jul 2001 16:40:50 +0200
From: Jan Debiec <jan.debiec@jurca.de>
MIME-Version: 1.0
To: Vipin Malik <Vipin.Malik@daniel.com>,
 	"'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS and RTLinux
References: <30724FF712DFD2119E6200104B244892011974BC@mail1>
Content-Type: text/plain; charset=us-ascii
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

Thanks Vipin,

I've installed RTAI-1.6 as UP with Arcom-2.2.17 kernel (by RTAI
configuration, you don't need to set SMP flag) and the Arcom board is
running. Not only board, the RTAI tests are running on Arcom too

Jan

P.S. But the question is still open, why has MTD and JFFS problems with
SMP flag set in kernel config.

Vipin Malik wrote:
> 
> I know that at least with RTAI, you can set the SMP flag off and then use
> the 8259 timer UP scheduler. RTL does not have something similar?
> 
> Vipin
> 
> P.S. I assume that without the SMP flag (and RTLinux) everything works fine?
> 
> -----Original Message-----
> From: Jan Debiec
> To: linux-mtd@lists.infradead.org
> Sent: 7/26/01 5:08 AM
> Subject: JFFS and RTLinux
> 
> Hello,
> 
> I'm trying to use RealTimeLinux (RTL 3.0 pre9) on Arcom MediaGX SBC
> (2.2.17 with MTD and JFFS1)
> AS condition to run RTL, kernel (2.2.17) must be compiled with SMP flag
> set on.
> But then the JFFS is not running properly, kernel is not able to mount
> the /dev/mtdblock2 as root fs. After message "Building JFFS fs crash
> recovery tree ... " system is hanging.
> Do you know the solution?
> 
> Jan
> --
> ----------------------------------
>  Jan Debiec
>  Jurca Optoelektronik
>  Raiffeisenstr. 5D
>  D-63110 Rodgau (Dudenhofen)
>  Germany
> 
>  tel      +49 6106 8290 20
>  fax      +49 6106 8290 26
>  email    jan.debiec@jurca.de
>  www.jurca.de
> ----------------------------------
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
----------------------------------	
 Jan Debiec    
 Jurca Optoelektronik
 Raiffeisenstr. 5D
 D-63110 Rodgau (Dudenhofen)
 Germany 
 
 tel      +49 6106 8290 20
 fax      +49 6106 8290 26
 email    jan.debiec@jurca.de
 www.jurca.de
----------------------------------
