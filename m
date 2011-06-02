Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSCZD-0002CA-RJ
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 18:24:25 +0000
Received: by wyb28 with SMTP id 28so1175640wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 11:24:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTin0ki3brkxP02pxuZ2m6QBe=9bNhA@mail.gmail.com>
References: <1306936600-28870-1-git-send-email-jiri.pinkava@vscht.cz>
	<BANLkTin0ki3brkxP02pxuZ2m6QBe=9bNhA@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 2 Jun 2011 23:54:01 +0530
Message-ID: <BANLkTi=aex1zmOS+V1FiWVgoY+LySMfZFw@mail.gmail.com>
Subject: Re: [PATCH] nand: Remove meaningless delay from nand_unlock
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, Vimal Singh <vimalsingh@ti.com>, jiri.pinkava@vscht.cz,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 2, 2011 at 9:53 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jun 1, 2011 at 6:56 AM, =A0<jiri.pinkava@vscht.cz> wrote:
>> From: Jiri Pinkava <jiri.pinkava@vscht.cz>
>>
>> This delay is meaningless. If delay is needed it is device specific
>> and must be reimplemented by specific driver, otherwise no delay is
>> needed.
Indeed, these delays are not required. I guess it was left out code
before posting the patch.
Here is my ack:

Acked-by: Vimal Singh <vimal.newwork@gmail.com>

--=20
Regards,
Vimal Singh

>>
>> This function is not used by any current kernel code, affects only
>> external code (like main).
>
> Looks ok to me, but I don't have hardware to test this with.
>
> CC'ing Vimal who added this code originally.
>
> Brian
>
