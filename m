Received: from tweedy.ksc.nasa.gov ([128.217.76.165])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DTWF-0005OH-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 18:15:23 +0100
Subject: Re: Grub Booting Disk On Chip
From: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
Cc: Ilguiz Latypov <ilatypov@superbt.com>, linux-mtd@lists.infradead.org
In-Reply-To: <1022775288.26053.60.camel@tweedy.ksc.nasa.gov>
References: <Pine.LNX.4.44.0205301138270.16856-100000@server.superbt.com>
	<1022775288.26053.60.camel@tweedy.ksc.nasa.gov>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 30 May 2002 13:15:19 -0400
Message-Id: <1022778919.26053.70.camel@tweedy.ksc.nasa.gov>
Mime-Version: 1.0
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

Ilguiz,

I tried moving the DOC to 0xD800.  Grub reports that it is at 0xDE00
(still offset by 0x600).  Still no luck getting it to boot.  It's back
at 0xD000.  Could this be a BIOS problem on my board?

Bob...

On Thu, 2002-05-30 at 12:14, Bob Chiodini wrote:
    Ilguiz,
    
    No grub does not show any attempts to load from disk 0xE0.
    
    Entering root (dc0,0) reports that the DOC is at 0xd0000.  It almost
    looks as if interactive detection is handled differently than detection
    in grub_firmware.  
    
    Bob...
    
-- 
Bob Chiodini
Sr. Communications Engineer
Dynacs Engineering Company, Inc.
DNX-18
Kennedy Space Center, Florida 32899
321-867-6313 (voice)
321-867-6300 (fax)
