Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SEknf-000454-1l
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 17:12:15 +0000
Received: by ggnk1 with SMTP id k1so1453529ggn.36
 for <linux-mtd@lists.infradead.org>; Mon, 02 Apr 2012 10:12:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
Date: Mon, 2 Apr 2012 10:12:13 -0700
Message-ID: <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
Subject: Re: Unstable bits and JFFS2
From: Brian Norris <computersforpeace@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matej,

On Wed, Mar 28, 2012 at 4:16 AM, Matej Kupljen <matej.kupljen@gmail.com> wrote:
> during my experiments with the UBIFS crashing, I believe that I am experiencing
> the "unstable bit" issue.
>
> Would another FS, like JFFS2 work on such device, or I'd have the problems on
> such device with all file systems?

I doubt it. JFFS2 is not supported much anymore, and it is not
designed for some of the problems with modern NAND flash.

Have you read the information here?

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

I'm not much of an export on UBIFS or unstable bits, but I think that
there are some unsolved problems. However, before ruling this an
unstable bits problem, it's a good idea to rule out any other possible
issues.

Brian
