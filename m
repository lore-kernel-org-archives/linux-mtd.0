From: David Woodhouse <dwmw2@infradead.org>
To: Matthias Gorjup <mgorjup@norik.com>
In-Reply-To: <Pine.LNX.4.10.10403021452090.17724-100000@mail.hurricane.at>
References: <Pine.LNX.4.10.10403021452090.17724-100000@mail.hurricane.at>
Content-Type: text/plain
Message-Id: <1078236528.17069.113.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 02 Mar 2004 14:08:49 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Speed of writing to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Try disabling the 'erase suspend' feature if it's active. Just set
extp->EraseSuspend to zero in cfi_cmdset_0002().

-- 
dwmw2
