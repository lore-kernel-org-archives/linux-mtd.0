Received: from wx-out-0506.google.com ([66.249.82.225])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H3qp6-0005QS-An
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 04:29:46 -0500
Received: by wx-out-0506.google.com with SMTP id s16so1085wxc
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Jan 2007 01:29:43 -0800 (PST)
Message-ID: <740e30f50701080129i40911241u7bea2b35b64b60bb@mail.gmail.com>
Date: Mon, 8 Jan 2007 11:29:42 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: read-while-load (known problem)
In-Reply-To: <702140.499381168244009661.JavaMail.weblogic@ep_ml21>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <702140.499381168244009661.JavaMail.weblogic@ep_ml21>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/8/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> Hi Adrian,
>
> > Do you think there could be a problem with onenand_check_bufferram also?
>
> No, onenand_check_bufferram & onenand_update_bufferram is right.
>

What I meant was this:

1. Read page x from chip 0. It goes to dataRAM 0 in chip 0
2. Read page y from chip 1. It goes to dataRAM 1 in chip 1
3. Read page x from chip 0. Now the read incorrectly comes from
dataRAM 0 in chip 1 because that was the last chip selected.
