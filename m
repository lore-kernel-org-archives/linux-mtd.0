Received: from an-out-0708.google.com ([209.85.132.242])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hoixr-0003gp-G0
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 12:36:32 -0400
Received: by an-out-0708.google.com with SMTP id d17so146763and
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 May 2007 09:36:29 -0700 (PDT)
Message-ID: <93840d070705170936o7188807do17f29422f7e31404@mail.gmail.com>
Date: Thu, 17 May 2007 22:06:28 +0530
From: "Sekhar Nori" <nori.sekhar@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: Priority inversion when using MTD
In-Reply-To: <1179409930.2859.495.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <93840d070705170620x4a61007ap537ce877acfab488@mail.gmail.com>
	<1179409930.2859.495.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/17/07, David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2007-05-17 at 18:50 +0530, Sekhar Nori wrote:
> > I have a high priority SCHED_FIFO task which runs out of a squashfs file system.
> > When this process needs to fetch a page from the flash (due to demand paging),
> > it is sometimes made to wait for another low priority SCHED_NORMAL
> > task which is doing an erase on some other mtd partition.
>  ...
> > Is there any way to avoid this scenario? Any help/pointers would be appreciated.
>
> mlockall(2)

But doing so for all SCHED_FIFO tasks would make the system run out of memory :(

-
Sekhar Nori
