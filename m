From: splee@plexio.com (Stephen Lee)
Date: 30 Mar 2003 07:15:32 -0800
Subject: Can not compile patched 2.4.20 kernel...
In-Reply-To: <6D31D5429FA6884CBE9ECAB6C9B5E6A94445@intel-srvr.patcameron.ne.mediaone.net>
References: <6D31D5429FA6884CBE9ECAB6C9B5E6A94445@intel-srvr.patcameron.ne.mediaone.net>
Message-ID: <1049037332.15384.2.camel@ralph.plexio.private>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sat, 2003-03-29 at 22:38, Thomas Cameron wrote:
> Hello all,
> 
> 	I have been trying (for a few days now) to get my kernel patched
> and compiled with the latest CVS sources for jffs(2), and the MTD
> devices.  The problem, however, is that I keep getting the `parse error
> before "struct"` message when actually compiling the sources.
> 
>        I have searched through google for every possible combination of
> header file names, structure names, etc. that I can think of, and have
> had no good reference to fixing this on the x86 platform for the 2.4.20
> kernel series.  I would really love to be able to use the MTD sources
> instead of the M-Systems "DiskOnChip" kernel module, because of
> continuing development, support, and performance enhancements.
> 
Have you  tried 2.4.20 without the patches? It already has DOC and jffs2
support in it.

Stephen
