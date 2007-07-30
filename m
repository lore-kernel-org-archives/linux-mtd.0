Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
In-Reply-To: <1185557896.22352.4.camel@kleikamp.austin.ibm.com>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
Content-Type: text/plain
Date: Mon, 30 Jul 2007 13:45:08 +0100
Message-Id: <1185799508.3083.20.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-27 at 12:38 -0500, Dave Kleikamp wrote:
> I could only speculate, since I really don't know the code.  I suspect
> the writer of the comment had some other deadlock scenario in mind and
> didn't foresee the one that was encountered. 

I'm still confused because we deliberately ensure the page is up to date
in prepare_write -- so read_cache_page() should never have to lock it,
and we should never deadlock.

Or did I miss something in your analysis (or elsewhere)?

Why is read_cache_page() ever trying to lock this page in the first
place? It should be up to date.

-- 
dwmw2
