Message-ID: <4235ACE0.1040000@netwinder.org>
Date: Mon, 14 Mar 2005 10:25:20 -0500
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Chris Elston <chris.elston@radstone.co.uk>
References: <F38DEABE0E171746B133C1ABBD142D9703691AAF@radmail.Radstone.Local>
In-Reply-To: <F38DEABE0E171746B133C1ABBD142D9703691AAF@radmail.Radstone.Local>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@redhat.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] RE: Autodetection problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chris Elston wrote:

> I've managed to fix it for me by reversing the direction of the loop in
> genprobe_new_chip - i.e.: assume the bank has max_chips and work down.
> I think this is the safer way to do it, but I'm not sure, and I'd like
> someone to look at this and confirm it for me.
> 
> Ralph, let me know if this fixes your case.

Yes, it works for me as well.

-R
