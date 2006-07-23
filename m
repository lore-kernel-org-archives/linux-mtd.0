Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G4ilw-0002e1-6t
	for linux-mtd@lists.infradead.org; Sun, 23 Jul 2006 14:33:54 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1957852ugc
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Jul 2006 11:33:42 -0700 (PDT)
Message-ID: <625fc13d0607231133p28854ce7t74c96e3484415284@mail.gmail.com>
Date: Sun, 23 Jul 2006 14:33:42 -0400
From: "Josh Boyer" <jwboyer@gmail.com>
To: "falls huang" <falls.huang@gmail.com>
Subject: Re: can I use vfat filesystem on UBI layer?
In-Reply-To: <49eab5c80607230204k53cde2adm9ef7290ce90e465f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <49eab5c80607230204k53cde2adm9ef7290ce90e465f@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/23/06, falls huang <falls.huang@gmail.com> wrote:
> Hello!
>
>   as title .

I believe that is one of the intended goals.  A block layer needs to
be added (much like mtdblock), and then one should be able to use
vfat, ext2, ext3, reiserfs, etc.

josh
