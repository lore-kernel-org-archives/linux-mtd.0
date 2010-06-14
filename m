Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOBOK-0001Dg-F5
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 15:16:01 +0000
Received: by gwj18 with SMTP id 18so2856236gwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jun 2010 08:15:57 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1276422454.19028.209.camel@localhost>
References: <AANLkTik2mO4lpL5QA1kzMf4zp-Prd-SdhSNLVcHB9isl@mail.gmail.com>
	<1276422454.19028.209.camel@localhost>
Date: Mon, 14 Jun 2010 11:15:54 -0400
Message-ID: <AANLkTikt_Y_DPNZP7jKvBrHgD230po4lqJWBE5vRVl20@mail.gmail.com>
Subject: Re: detecting that ubifs switched to ro after problem
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 13, 2010 at 5:47 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2010-06-11 at 22:46 -0400, Jon Ringle wrote:
>> Hi,
>>
>> I'd like to be able to somehow detect that ubifs has taken the action
>> of switching from rw to ro due to some error detected in the ubifs
>> filesystem. If I can detect this then maybe I can do something about
>> it, such as copying the ubifs contents to a .tar.bz2 in /tmp,
>> mkfs.ubifs, and restore .tar.bz2 back again.
>>
>> Is there a way I can do this?
>
> I think with 2fde99cb55fb9d9b88180512a5e8a5d939d27fec you can check for
> R/O state from /proc/mounts. Also, you can use something like inotify to
> watch /proc/mounts changes and react if UBIFS became r/o.

Any possibility of having that merged into
git://git.infradead.org/~dedekind/ubifs-v2.6.32.git?
