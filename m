Subject: Re: status of nomadik mtd patches
From: David Woodhouse <dwmw2@infradead.org>
To: Alessandro Rubini <rubini-list@gnudd.com>, Magnus Damm <damm@igel.co.jp>,
	Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20090920105002.GA15561@mail.gnudd.com>
References: <20090920105002.GA15561@mail.gnudd.com>
Content-Type: text/plain
Date: Sun, 20 Sep 2009 06:05:08 -0700
Message-Id: <1253451908.6317.102.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: STEricsson_nomadik_linux@list.st.com, vimal.newwork@gmail.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-09-20 at 12:50 +0200, Alessandro Rubini wrote:
> I would like to know what is the status of the Nomadik MTD patches
> (Nand and OneNand).  I had accepted all comments and posted them the
> list.

I've applied these, but the onenand support will be broken due to
http://git.infradead.org/mtd-2.6.git/commitdiff/778dbcc1

I'd try to fix it up myself, but I'd rather it was done by someone who
can actually test it. Please?

-- 
dwmw2
