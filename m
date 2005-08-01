From: David Woodhouse <dwmw2@infradead.org>
To: Amit Sharma <amitsharma91@gmail.com>
In-Reply-To: <9185a3fa050729193514dd5f8@mail.gmail.com>
References: <9185a3fa050729193514dd5f8@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 01 Aug 2005 01:38:16 +0100
Message-Id: <1122856696.8317.57.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-07-30 at 11:35 +0900, Amit Sharma wrote:
> 3. If i create file of more than 1.3MB Jffs2 response degraded during
> ls-la and using of benchmarking.
> 
> I am using linux 2.4 kernel

The 2.4 kernel is ancient and slow. You should find the code in 2.6 is a
_lot_ faster.

-- 
dwmw2
