Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
In-Reply-To: <1185896168.14534.17.camel@kleikamp.austin.ibm.com>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
	<1185813909.9523.42.camel@kleikamp.austin.ibm.com>
	<1185883827.3083.109.camel@pmac.infradead.org>
	<1185888229.14534.13.camel@kleikamp.austin.ibm.com>
	<1185895406.3083.117.camel@pmac.infradead.org>
	<1185896168.14534.17.camel@kleikamp.austin.ibm.com>
Content-Type: text/plain
Date: Tue, 31 Jul 2007 17:23:12 +0100
Message-Id: <1185898992.3083.120.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>,
	linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-31 at 10:36 -0500, Dave Kleikamp wrote:
> Could be.  Remember this was on a 2.4 kernel as well, so mileage may
> vary on the latest code. 

Right. NAND was never even properly supported on 2.4.

Of course, there's still the fact that Nathan reports that this approach
_exacerbates_ his problem rather than fixing it. If your patch actually
fixes something for him, we'll need to look more closely at why (and if
not, we need to look more closely at his problem anyway).

-- 
dwmw2
