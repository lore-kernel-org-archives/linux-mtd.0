Received: from wx-out-0506.google.com ([66.249.82.225])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KceFK-0005qK-De
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 10:45:26 +0000
Received: by wx-out-0506.google.com with SMTP id s15so122818wxc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Sep 2008 03:45:25 -0700 (PDT)
Date: Mon, 8 Sep 2008 06:44:58 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: [PATCH 1/6] [MTD-UTILS] nanddump: Qualifier Clean-up
Message-ID: <20080908064458.7f4c0fa8@zod.rchland.ibm.com>
In-Reply-To: <1220856321-22712-1-git-send-email-gerickson@nuovations.com>
References: <1220856321-22712-1-git-send-email-gerickson@nuovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun,  7 Sep 2008 23:45:21 -0700
Grant Erickson <gerickson@nuovations.com> wrote:

> Static-qualified all globals except 'main' because they have no use
> beyond file scope.
> Constant-qualified MTD device and input positional parameter globals.
> Constant-qualified argv array.
> 
> Signed-off-by: Grant Erickson <gerickson@nuovations.com>

These all look fine.  I'll apply them in a bit.

josh
