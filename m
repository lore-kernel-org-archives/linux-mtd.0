Received: from wa-out-1112.google.com ([209.85.146.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JMaau-0000ij-K0
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 03:05:10 +0000
Received: by wa-out-1112.google.com with SMTP id v33so214687wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Feb 2008 19:05:02 -0800 (PST)
Message-ID: <9b52d64c0802051905p5db6b6e1w9b065ffc10243f02@mail.gmail.com>
Date: Tue, 5 Feb 2008 19:05:02 -0800
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: vishalk@tataelxsi.co.in
Subject: Re: what is the user space header file for mtdchar.c kernel driver
In-Reply-To: <001801c867e6$dbadab30$65053c0a@telxsi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <001801c867e6$dbadab30$65053c0a@telxsi.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What exactly do you want to do with mtdchar??
To access char driver you need to use dev file /dev/mtdchar,
it doesn't need any header file.

--Vinit.

On Feb 5, 2008 3:04 AM, vishalk <vishalk@tataelxsi.co.in> wrote:
> I'm trying to access char device with mtdchar.c driver from user space.
> I'm not able to find the header file for that to use in the user space
> program.
>
>
> VK
>
>
> The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.
>
> Contact your Administrator for further information.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Life is so short. So, follow some rules. Forgive quickly, believe
slowly, love truly, laugh loudly & never avoid anything that makes U
smile.
