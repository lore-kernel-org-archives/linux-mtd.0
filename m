Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bpfS-0004Qu-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 22:45:34 +0100
Date: Mon, 5 Aug 2002 22:45:33 +0100
Subject: Re: Disk blocks for long periods 
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: linux-mtd@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <28973.1028558573@redhat.com>
Message-Id: <AB0AE002-A8BC-11D6-9E39-000502893FA1@regolith.co.uk>
Content-Transfer-Encoding: 7bit
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

On Monday, August 5, 2002, at 03:42 PM, David Woodhouse wrote:

>
> joakim.tjernlund@lumentis.se said:
>>> SysRq-T should work on PPC. It's mostly generic code. What's wrong
>>> with it?
>
>> Maybe I spoke too soon, but I can not make sense of it:
>
> That's because you're using 2.4.2.

...2.4.2 was the last-but-one Redwood PPC kernel release from Montavista;
they have a 2.4.17 out now which is much more stable and faster.

On the 2.4.2 kernel we had lots of odd little problems with stuff like
this that Just Went Away with 2.4.17.

(in ppc405gp land) Jas.
