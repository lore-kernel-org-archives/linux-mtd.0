From: splee@plexio.com (Stephen Lee)
Date: 30 Mar 2003 08:52:29 -0800
Subject: Can not compile patched 2.4.20 kernel...
In-Reply-To: <6D31D5429FA6884CBE9ECAB6C9B5E6A94446@intel-srvr.patcameron.ne.mediaone.net>
References: <6D31D5429FA6884CBE9ECAB6C9B5E6A94446@intel-srvr.patcameron.ne.mediaone.net>
Message-ID: <1049043149.15393.12.camel@ralph.plexio.private>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-03-30 at 07:28, Thomas Cameron wrote:
> Stephen,
> 
> 	First off, thank you for your reply.  Yes, I have tried it
> without patching it to CVS.  However, when I boot, I get the "Do not
> cupport blocksize..." error.  I remember from _forever_ ago, that this
> is due to the fact that I am using the latest DOC DIOS from M-Systems.
> However, I can not seem to put together the correct google search to
> find the mailing list posting again.
> 
> 	So, any suggestions from here?  I have been looking at the CVS
> pages on the infradead.org site, and trying to piece togerher in my mind
> what has changed since the last snapshot or release.  Unfortunately, too
> much has changed to be useful to me.  Anyway, any further help is
> greatly appreciated!

Thomas,

Have you tried the older 4.2 DFORMAT from M-Systems? Apparently v5
DFORMAT is not compatible with the newer kernels and I had problems
getting the DOC2000 recognized under 2.4.20.

Stephen
