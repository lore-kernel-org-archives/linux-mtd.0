From: David Woodhouse <dwmw2@infradead.org>
To: Davide CASCONE <davide.cascone@st.com>
In-Reply-To: <002801c679b5$60bd2d90$253682a4@nap.st.com>
References: <002801c679b5$60bd2d90$253682a4@nap.st.com>
Content-Type: text/plain
Date: Wed, 17 May 2006 15:44:26 +0100
Message-Id: <1147877067.3875.16.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-17 at 15:25 +0200, Davide CASCONE wrote:
> The file system still works properly. So, I have the following
> questions: 
> 1. Do you have some suggestion to solve my problem? 

Mount read-only or unmount, at _least_ sync, before rebooting.

> 2. With my patch it seems that the headers are not correctly written.
> Do you know anything about it? 

It looks like you haven't correctly synced -- there are still buffers
waiting to be written. The node which it complains about was already
partially written to the flash, but the _end_ of the node is still in
the buffer. So the CRC fails and you get a harmless complaint.

> 3. Do you know if a most recent patch is available? 

The CVS tree is no longer used. The current MTD code is in the git tree
at git://git.infradead.org/mtd-2.6.git -- browsable at
http://git.infradead.org/?p=mtd-2.6.git

-- 
dwmw2
