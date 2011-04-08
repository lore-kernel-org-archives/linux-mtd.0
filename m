Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q80Vx-0004ye-Ev
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 01:29:34 +0000
Received: by pzk5 with SMTP id 5so1290733pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 18:29:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTimFQH2K-gxvHzcKaDU4Xv4zDHHO6g@mail.gmail.com>
References: <BANLkTimFQH2K-gxvHzcKaDU4Xv4zDHHO6g@mail.gmail.com>
Date: Thu, 7 Apr 2011 18:29:30 -0700
Message-ID: <BANLkTi=k18QKZCwaLnPpmvGhNK2WNRWkGg@mail.gmail.com>
Subject: Re: Creating a panic_write() for the common flash interface driver
From: Rick Ramstetter <rick.ramstetter@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm still wondering about the following questions.

Thank you,
--Rick

On Wed, Apr 6, 2011 at 11:21 AM, Rick Ramstetter
<rick.ramstetter@gmail.com> wrote:
> Hi all,
>
> I would like to use the mtdoops module to record kernel panics.
> Unfortunately, the common flash interface driver doesn't define a
> panic_write() function in struct mtd_info. Thus, the mtdoops driver is
> unable to write to flash from kernel panic context.
>
> Has anyone attempted to (or successfully) implemented such a
> panic_write() function for AMD compatible (cfi_cmdset_0002.c) CFI
> chips before? Care to share any relevant pointers or potential
> pitfalls?
>
> If there is a more appropriate mailing list to ask this question on,
> please share relevant information about.
>
> Thank you,
> --Rick.
>
