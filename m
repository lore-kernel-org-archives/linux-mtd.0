Received: from mout01.kundenserver.de ([195.20.224.132])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UnPk-0002Cz-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2001 11:51:44 +0100
Message-ID: <3B726C90.F8A182F5@jurca.de>
Date: Thu, 09 Aug 2001 12:57:20 +0200
From: Jan Debiec <jan.debiec@jurca.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
 	"'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
CC: "Alex Lennon @ Arcom" <ajlennon@arcom.co.uk>
Subject: Re: JFFS and RTLinux
References: <3B6571F2.6258156D@jurca.de>  <30724FF712DFD2119E6200104B244892011974BC@mail1> <12764.997170980@redhat.com>
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

Hi David,

as you suggested,

David Woodhouse wrote:
> jan.debiec@jurca.de said:
> >  P.S. But the question is still open, why has MTD and JFFS problems
> > with SMP flag set in kernel config.
> 
> Reproduce on a non-RT kernel and use SysRq-P to find where it's blocking.


the results:
EIP: 0010:[<c01986d3>] EFLAGS: 00000202
...			EBP: c01d0040


in system.map for that kernel:
c0195940 T stext_lock
c019b360 R lk_lockmsg
...
c01d0040 d sbc_mediagx_map

unfortunately "stext_lock" tells me nothing (is used in head.S),
sbc_mediagx_map is a structure used for Arcom GXM board

Jan 
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
