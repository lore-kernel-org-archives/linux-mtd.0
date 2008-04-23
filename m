Subject: Re: PATCH: solving a hang while waiting in FL_STATUS
From: David Woodhouse <dwmw2@infradead.org>
To: abelbg@m2grp.com
In-Reply-To: <15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
References: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
	<1208946790.9212.782.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804231408140.28908@pentafluge.infradead.org>
	<15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 17:41:29 +0100
Message-Id: <1208968889.9212.827.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: abel.bernabeu@gmail.com, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 18:35 +0200, Abel Bernabeu wrote:
> I have added a timeout parameter to get_chip. It is a dirty solution
> but I cannot redesign that piece of code since I did not wrote it and
> I could introduce serious bugs.

Wimp. That never stopped anyone else. And having written it doesn't
really help either :)

-- 
dwmw2
