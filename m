Received: from mailhost.dragados.com ([194.224.246.95] helo=mw1-out-101.dragados.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17U2zt-0001Mk-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2002 11:22:29 +0100
Message-ID: <84BE72E17B15D61180E8009027E4112D056A67@WNT_EXCHANGE>
From: "Valls Pellicer,Joan" <jvp-sice-barcelona@dragados.com>
To: "'Herman@WirelessNetworksInc.com'" <Herman@WirelessNetworksInc.com>
Cc: linux-mtd@lists.infradead.org
Date: Mon, 15 Jul 2002 12:25:26 +0200
MIME-Version: 1.0
Content-Type: text/plain
Subject: (no subject)
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 17 Sep 2001, Herman Oosthuysen wrote: 
> Howdy, 
>
> Well, it would be horribly slow when system logs etc in /var are written
to
> flash, but in practice you can write to Flash an incredible number of
times 
> before it will become unreliable. In my experience the first thing 
> that happens with age is that the erase cycles become slower and may
increase 
> from around 500ms to as much as 15s, but the device will still work
reliably. 
> This aging happens quite quickly actually - a few hundred erase cycles and
the 
> device will be significantly slower than when new. (I have seen and fixed
many 
> erase algorithms that do not allow sufficient erase time for old parts!). 
I've been looking for this agging problem in M-Systems (like system
integrator), Toshiba and Samsung (like Flash memory manufacturers) Web pages
and I can't find any information. Only in Samsung flash FAQs I've find the
following question (and answer):
Q2. Is program/erase time deteriorated with the increase of program/erase
cycles? 
 <<...OLE_Obj...>> 
A : Samsung's NAND Flash goes through an internal qualification process with
endurance up to 1M cycles. Since NAND Flash has superior endurance to other
Flash technology, the closing of cell threshold is not noticeable until 1M
cycles. The erase time does not change at all, regardless of endurance up to
1M cycles. The program time could take a little longer or does not change. 
 <<...OLE_Obj...>> 
Samsung says that their erasing cycle typical is 2 mseg. and maximal is 3
mseg., which differs a lot of your measurements. When you said 500 mseg.,
were you talking about format operations?
Do you know if this agging problems still occurs? Does it happen with a
specific vendor or product?

Joan Valls
jvp-sice-barcelona@dragados.com
