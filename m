Received: from tomts22-srv.bellnexxia.net ([209.226.175.184])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KJi3-0004hz-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 15:11:51 +0100
Date: Tue, 18 Jun 2002 10:11:45 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: David Cooper <david@forcedpotato.com>
cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFMEDLCEAA.david@forcedpotato.com>
Message-ID: <Pine.LNX.4.44.0206181008320.3554-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

David,

Perhaps, running xinit command under gdb can help.  To go step-by-step 
through the lines of code, a debug version of xinit would be more helpful.  
I believe the gcc -g option will provide necessary debug information in 
the produced executable binary.

Ilguiz

On Mon, 17 Jun 2002, David Cooper wrote:

> I tried this but, of course, the screen goes blank, system hangs and I
> can never look at the xinit.log file.
