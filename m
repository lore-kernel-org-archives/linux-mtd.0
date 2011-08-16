Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qt8oV-0003jD-U1
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 01:51:32 +0000
Received: by wwf10 with SMTP id 10so3915682wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 18:51:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313423331.8691.11.camel@sauron>
References: <CAN8TOE8VHm2jMkFonfi+4bvmP8ORVVdXA0vb3-X8+XCGfTuAaw@mail.gmail.com>
	<1313423331.8691.11.camel@sauron>
Date: Mon, 15 Aug 2011 18:51:28 -0700
Message-ID: <CAN8TOE-YqmtF6KcRjTH8-1W6V9_9hKFaihruy+SrP9Xw-7Y8Sg@mail.gmail.com>
Subject: Re: 'nandwrite -o' on MLC NAND
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 15, 2011 at 8:48 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> I guess making the old interfaces to be based on the new one internally
> is also needed to keep things clean. Then we can declare the old
> interfaces "legacy and obsolete", but will have to support anyway, of
> course.

OK, I haven't gotten as far as "making the old interfaces to be based
on the new one", but that sounds reasonable. I'll see how nicely the
old interfaces can be merged into the new one tomorrow, and perhaps
I'll send a test patch soon as well.

Brian
