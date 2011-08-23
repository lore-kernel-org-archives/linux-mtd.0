Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvk58-000261-Jo
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 06:03:27 +0000
Received: by yxk8 with SMTP id 8so5003042yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 23:03:24 -0700 (PDT)
Subject: Re: [RFC 5/5] mtd: add MEMWRITEDATAOOB ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 09:05:12 +0300
In-Reply-To: <CAN8TOE9kZa5g9baQ63ojUYK7uqrwA9GEf_6oYz1S-kacZRq+5Q@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-6-git-send-email-computersforpeace@gmail.com>
	<1314003384.2644.85.camel@sauron>
	<CAN8TOE9kZa5g9baQ63ojUYK7uqrwA9GEf_6oYz1S-kacZRq+5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314079518.2645.55.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-22 at 17:04 -0700, Brian Norris wrote:
> BTW, I'm considering splitting the usr_ptr into separate buffers for
> data and oob. This will probably be a little easier for the user
> interface as well as for internal kernel operations. Anyway, the
> resulting struct is looking more and more like the existing `struct
> mtd_oob_ops' (this is kind of by design); is it still a good idea to
> keep the user-facing struct independent of the internal mtd_oob_ops
> struct? I'm thinking it would leave some flexibility for the future. 

Yes, it is good idea, and you anyway cannot use the same struct for
both, because structs for ioctl have more limitation WRT struct size
(best to make it to be multiple of 64-bits), fileds (no pointers should
be used, better types like _u32 should be used), reserve for future (a
pool of bytes which user must set to 0 and which we can use in future).

-- 
Best Regards,
Artem Bityutskiy
