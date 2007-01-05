Received: from wx-out-0506.google.com ([66.249.82.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2ke1-0006wi-EM
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 03:41:47 -0500
Received: by wx-out-0506.google.com with SMTP id h30so7035332wxd
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jan 2007 00:41:44 -0800 (PST)
Message-ID: <740e30f50701050041x1f6f0a9t50e0eae07afd305b@mail.gmail.com>
Date: Fri, 5 Jan 2007 10:41:44 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: read-while-load
In-Reply-To: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
Cc: Josh Boyer <jwboyer@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/5/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> Hi,
>
> it looks good to me. except one
>
> > +     /* Read-while-load method */
> >
> > +     /* Do first load to bufferRAM */
> > +     if (read < len) {
>
> I think it is alway true. Is there any case that sends zero 'len' from upper layer?
>

I don't know if the upper layer sends zero as 'len', but I would not
trust it not to.  I do not see any harm in the statement.
