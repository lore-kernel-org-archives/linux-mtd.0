Received: from mx3.aruba.it ([62.149.128.132])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AVpef-0006eP-0u
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2003 10:08:45 +0000
From: Andrea Galbusera <andrea.galbusera@teamware.it>
To: linux-mtd <linux-mtd@lists.infradead.org>, uClinux development list
	<uclinux-dev@uclinux.org>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1071482990.3915.106.camel@andreagal>
Mime-Version: 1.0
Date: 15 Dec 2003 11:09:50 +0100
Content-Transfer-Encoding: 8bit
Subject: AMD flash lock/unlock support question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!
I´m new to embedded linux development, so, please, be patient if I ask
for anything silly.

I´m working with a Coldfire/uClinux system. The hardware mounts two AMD
Am29DL640G flash chips. I can succesfully enable read/write/erase
operations via MTD using uClinux kernel 2.4.20-uc0. 

My project actually require to support lock/unlock functions to protect
some flash memory sections. Are they already available for AMD chips?
Anybody succeded using these functions through util/lock.c and
util/unlock.c tools?

Looking at more recent sources from mtd cvs I saw some functions in
cfi_cmdset_0002.c (is this the right one for my chips?) which look to be
relevant for my problem (cfi_amdstd_lock_varsize() and
cfi_amdstd_unlock_varsize()). What development status are these?

TIA
Andrea
