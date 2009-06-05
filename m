Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCa2C-0000w2-Nz
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 14:04:47 +0000
Received: by bwz4 with SMTP id 4so1619475bwz.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jun 2009 07:04:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244206994.20718.7.camel@tommy-desktop>
References: <1244204035.18630.0.camel@tommy-desktop>
	<71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
	<1244206994.20718.7.camel@tommy-desktop>
Date: Fri, 5 Jun 2009 16:04:38 +0200
Message-ID: <71cd59b00906050704m650d9701q1012dc8b649d8d7f@mail.gmail.com>
Subject: Re: about ubifs
From: Corentin Chary <corentin.chary@gmail.com>
To: tommy <jiujin.hong@mid-fun.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 5, 2009 at 3:03 PM, tommy<jiujin.hong@mid-fun.com> wrote:
> no,i didn't fsync when i close file !
>
> did ubifs driver can achieve "fsync" when user modify some file and
> close with save ?

For critical data, you need to call fsync to be sure the data is
stored on the flash.
There is also a "sync" option for ubifs, but this will hurt performance a lot.

> if system have no power and shutdown system forcely ,user's file will
> become no contents in some case ,how did we protect this ?

What does the application do ?
Only open - write - close ? Do you also rename files ?
I believe that the content should not disapear when you only do a write.

You can activate ubifs debug to check if there is more informations.

-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
