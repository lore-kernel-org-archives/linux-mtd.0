Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8UzC-0001Sv-Ej
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 07:52:48 +0000
Received: by fxm8 with SMTP id 8so3477203fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 00:52:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243236757.21646.54.camel@localhost.localdomain>
References: <1243234150-29786-1-git-send-email-corentincj@iksaif.net>
	<1243236757.21646.54.camel@localhost.localdomain>
Date: Mon, 25 May 2009 09:52:39 +0200
Message-ID: <71cd59b00905250052i6e04efd3j27eeaf35f0495f7f@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: Add an error code if the compr is not present
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
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

On Mon, May 25, 2009 at 9:32 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Mon, 2009-05-25 at 08:49 +0200, Corentin Chary wrote:
>> If the compressor is not present, mount_ubifs need
>> to return an error code. This way ubifs_fill_super
>> will stop and handle the error.
>>
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>
> Pushed to ubifs-2.6.git, thank you!
>

For information, this bug was triggered when running an userspace
version of ubifs (code available soon).
We used the original ubifs to format the partition, but our version
didn't support the lzo compressor (now, it do).
Then, valgrind/gdb to get a backtrace and "voila".

-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
