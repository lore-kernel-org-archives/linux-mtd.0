Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DIu6F-00019N-1K
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2005 15:52:35 -0400
Message-ID: <4252EC5D.4090806@ieee.org>
Date: Tue, 05 Apr 2005 15:51:57 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>
	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>
	<42527DD5.4080009@infocell-its.com>
In-Reply-To: <42527DD5.4080009@infocell-its.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zeri Virgo wrote:

> Rebooted and disabled/removed all other boot devices. As the BIOS gets 
> going, I see "Installing DOCBoot." then a "System Configurations" page 
> with
>     ...<snip>...
>     Verifying DMI Pool Data .........
>     Loading kernel... _
>
> where the "_" is a flashing cursor. The keyboard is unresponsive and 
> nothing further happens :(


OK, I'm slightly stumped.  So, I've just checked into CVS some 
additional changes to DOCBoot.  There is a small (but important) fix to 
memory size detection, which shouldn't affect you since you're not using 
initrd (I think).

There is also a new option in doc_bootstub.h: #define DEBUG_BUILD.  This 
will print out some interesting info during the "Installing DOCBoot" 
phase, and wait for a keypress.  Please copy it down and let me know 
what it says.  It will also be more verbose during the actual kernel 
loading phase; hopefully that will let us pin down exactly where it's 
hanging.

    -Dan
