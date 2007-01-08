Received: from wr-out-0506.google.com ([64.233.184.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H3vgi-0007MB-5x
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 09:41:26 -0500
Received: by wr-out-0506.google.com with SMTP id i3so2474557wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Jan 2007 06:41:20 -0800 (PST)
Message-ID: <740e30f50701080641q11bb536v1ce4339378de59d4@mail.gmail.com>
Date: Mon, 8 Jan 2007 16:41:20 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: read-while-load (known problem)
In-Reply-To: <740e30f50701080129i40911241u7bea2b35b64b60bb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <702140.499381168244009661.JavaMail.weblogic@ep_ml21>
	<740e30f50701080129i40911241u7bea2b35b64b60bb@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/8/07, Adrian Hunter <hunter.programmer@gmail.com> wrote:
> On 1/8/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> > Hi Adrian,
> >
> > > Do you think there could be a problem with onenand_check_bufferram also?
> >
> > No, onenand_check_bufferram & onenand_update_bufferram is right.
> >
>
> What I meant was this:
>
> 1. Read page x from chip 0. It goes to dataRAM 0 in chip 0
> 2. Read page y from chip 1. It goes to dataRAM 1 in chip 1
> 3. Read page x from chip 0. Now the read incorrectly comes from
> dataRAM 0 in chip 1 because that was the last chip selected.
>
Ah, I see now, onenand_check_bufferram only checks the current dataRAM
so it won't have the wrong chip selected. Please disregard previous
email. Sorry.
