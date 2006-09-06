Received: from smtp-relay.tamu.edu ([165.91.22.120] helo=sr-7-int.cis.tamu.edu)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKlR0-0000XC-Vs
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 01:38:31 +0100
Received: from localhost (localhost.tamu.edu [127.0.0.1])
	by sr-7-int.cis.tamu.edu (Postfix) with ESMTP id AAB3E11C4
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Sep 2006 19:37:57 -0500 (CDT)
Received: from hobbiton.cs.tamu.edu (smtp.cs.tamu.edu [128.194.138.66])
	by sr-7-int.cis.tamu.edu (Postfix) with ESMTP id 3A41710B7
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Sep 2006 19:37:57 -0500 (CDT)
Received: from sun (sun.cs.tamu.edu [128.194.138.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hobbiton.cs.tamu.edu (Postfix) with ESMTP id D630D82B8F
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Sep 2006 19:37:56 -0500 (CDT)
Date: Tue, 5 Sep 2006 19:37:56 -0500 (CDT)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: linux-mtd@lists.infradead.org
Subject: Running nandsim 
Message-ID: <Pine.GSO.4.58.0609051935330.19487@sun>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to run nandsim on linux kernel 2.6.16. However, during
configuration (make menuconfig), there is no option to install nandsim as
a module. The only options are to include it in the kernel or not. Is
there a way to run nandsim if its included as part of the kernel (and not
as a module) ?

thanks,
-siddharth

_____________________________________________________________________
     Unix is user friendly - its just picky about its friends.
_____________________________________________________________________
