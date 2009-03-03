Received: from el-out-1112.google.com ([209.85.162.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LeS38-00080N-6Z
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 10:40:36 +0000
Received: by el-out-1112.google.com with SMTP id z25so3976957ele.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Mar 2009 02:40:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1236067185.4261.51.camel@localhost.localdomain>
References: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
	<1236062311.4261.43.camel@localhost.localdomain>
	<71cd59b00903022348u34f272cci927fe492c006125d@mail.gmail.com>
	<1236067185.4261.51.camel@localhost.localdomain>
Date: Tue, 3 Mar 2009 11:40:32 +0100
Message-ID: <52e42efe0903030240i22eb78dcjab2bf37d2e14694c@mail.gmail.com>
Subject: Re: libubiio : userspace UBI input output library
From: Sidney Amani <seed95@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Corentin Chary <corentin.chary@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 3, 2009 at 8:59 AM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> Well, I personally do not see any reason not to merge this. I just
> suggest to work with mtd-utils from the very beginning. I know it looks
> very messy and crappy. But you may make it better while working with it.
> And that would be a great contribution as well. And this would be more
> collaborative, I think.
>

Hi Artem,

Actually yes we shouldn't work on our own side, but as we didn't feel
like sending patches and patches..
It's may be possible to work on a specific branch?
Anyway next time we will try to do it more collaborative.

> So far, it looks like ubi-utils/new-utils would be a better place for
> this, isn't it?

I think so.
Our lib has some redundant functionalities with libubi (e.g
ubi_get_device_info), so we may want to take some functions off.

Yes, mtd-utils is very messy, when will the new utils replace old one?
We are probably not in the best position to do it.

> But it would also be nice to send the source code to the
> ML. It will unlikely get much review, but still.
>

Ok, we will do it.

-- 
Sidney Amani
http://uffs.org
