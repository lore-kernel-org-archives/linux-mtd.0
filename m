Subject: Re: PATCH: solving a hang while waiting in FL_STATUS
From: David Woodhouse <dwmw2@infradead.org>
To: Abel Bernabeu <abel.bernabeu@gmail.com>
In-Reply-To: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
References: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 11:33:10 +0100
Message-Id: <1208946790.9212.782.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 10:57 +0200, Abel Bernabeu wrote:
> I am experimenting an infinite loop problem happening at
> cfi_cmdset_0001.c:chip_ready.
> 
> Some kind of timeout while waiting  in FL_STATUS should be included.
> Indeed, this timeout feature is not new at all.
> 
> The feature was present in 2.6.23.17 but disappeared in 2.6.24 (after
> some refactoring work easily perceptible).

Hm. This was removed in commit 5a37cf19:
	Fix deadlock in Intel chip driver caused by get_chip recursion

Alexey, can you explain why you removed it? Abel's patch simply adds
this back where it was. That looks reasonable to me, so I'd like to know
if I've missed some reason why it shouldn't be there...

-- 
dwmw2
