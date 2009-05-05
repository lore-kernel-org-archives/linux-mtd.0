Received: from yw-out-1718.google.com ([74.125.46.155])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1J0Y-0001F0-6g
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 11:40:28 +0000
Received: by yw-out-1718.google.com with SMTP id 9so3008126ywk.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 04:40:20 -0700 (PDT)
Date: Tue, 5 May 2009 07:39:34 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: mtdutils and libubiio
Message-ID: <20090505113934.GA2459@yoda.jdub.homelinux.org>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 05, 2009 at 11:49:54AM +0200, Corentin Chary wrote:
>Hi,
>Some time ago we made libubiio available at :
>http://git.iksaif.net/?p=libubiio.git;a=summary
>I wanted to know how it can be used in mtd-utils, so we can start
>making patch for inclusion into mtd-utils.
>The first thing I see is mkfs.ubifs, using libubiio we will be able to
>run mkfs on an ubi volume. I believe it's
>simpler than creating a image, and using other tools to write it to the volume.
>Where can libubiio be used ?
>
>Another question, do you use static Makefiles for a reason ? Maybe we
>could move to CMake ?

We use them because they are simple.  There has been nothing to-date that
has really required anything else.  I have no experience with CMake, but
I'd rather avoid adding dependencies on it.

josh
