Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R67b4-0005Xj-Ju
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 21:11:19 +0000
Received: by eyd9 with SMTP id 9so633625eyd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 14:11:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <44e5a23d776bc650f9b605911f09deb438506c05.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
	<44e5a23d776bc650f9b605911f09deb438506c05.1316431431.git.andriy.shevchenko@linux.intel.com>
Date: Tue, 20 Sep 2011 14:11:16 -0700
Message-ID: <CAN8TOE_geqFbG1UhJa2fhb38=R3uXkqDC6DHbX_r=TvBkbO7bw@mail.gmail.com>
Subject: Re: [PATCH 2/7] jffs2reader: eliminate compiler errors
From: Brian Norris <computersforpeace@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 19, 2011 at 4:25 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> -#define DIRENT_INO(dirent) ((dirent)!=NULL?(dirent)->ino:0)
> -#define DIRENT_PINO(dirent) ((dirent)!=NULL?(dirent)->pino:0)
> +#define DIRENT_INO(dirent) ((dirent)!=NULL?je32_to_cpu((dirent)->ino):0)
> +#define DIRENT_PINO(dirent) ((dirent)!=NULL?je32_to_cpu((dirent)->pino):0)

Can you include proper spacing around the '!=', '?', and ':'
operators? It's easier to read.

Otherwise, I don't know the specifics on JFSS2-endianness, but the
motivation looks good...

Brian
