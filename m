From: David Woodhouse <dwmw2@infradead.org>
To: Lin.Colin@iac.com.tw
In-Reply-To: <A82FBA59E6742B4FACC6459749693FC0227DF0@NT51.IEC2.IAC>
References: <A82FBA59E6742B4FACC6459749693FC0227DF0@NT51.IEC2.IAC>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1078998091.867.66.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Mar 2004 09:41:31 +0000
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Porting JFFS2 to other OSs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-11 at 17:33 +0800, Lin.Colin@iac.com.tw wrote:
> Could somebody please tell me how difficult is it to port MTD and
> JFFS2 to BSD operating system?

It shouldn't be hard to port JFFS2, and its licence should permit that
as long as your changes to JFFS2 itself are released. 

The MTD code, however, is purely GPL and cannot be distributed in a BSD
kernel unless the whole kernel is also released under the GPL. You'd do
better to find your flash drivers elsewhere.

For porting JFFS2, look at the current code in CVS. It's already running
on both eCos and Linux, and I've even heard that someone ported it to
Windows.

> I heard that it’s very easy to port YAFFS to WinCE. As to JFFS2, it
> has some problems, like thread, on porting.

The thread is optional; eCos doesn't use it. But it could easily do so.

> And, is YAFFS much more suitable than JFFS2 to be used on NAND Flash?

They are different. Which is more suitable is dependent entirely on your
application.

-- 
dwmw2
