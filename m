Subject: Re: inconsistent behaviour with onenand with 2.6.24 kernel
From: David Woodhouse <dwmw2@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240804221753q518ab71aj1c8f7a356009abcb@mail.gmail.com>
References: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>
	<48084B80.2050601@nokia.com>
	<60e9ed290804202339v14b04468hafdbc9e088bee4fe@mail.gmail.com>
	<480C516A.5030105@nokia.com>
	<9c9fda240804221753q518ab71aj1c8f7a356009abcb@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 02:18:39 +0100
Message-Id: <1208913519.9212.703.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Abhijit Singh <mail2abhijit@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 09:53 +0900, Kyungmin Park wrote:
> On Mon, Apr 21, 2008 at 5:33 PM, Adrian Hunter
> <ext-adrian.hunter@nokia.com> wrote:
> > Abhijit Singh wrote:
> >  > I have tried all the above mentioned patches. But the status is same.
> >  > behaviour is inconsistent.
> >  > It still leads to system hangs while writing big files. Any other pointers ?
> >  > But it is working fine on 2.6.20 kernel.
> >
> >  That was the only problem I knew of.
> >
> >  You will need to dump the task list (using sysrq) when it hangs and try
> >  to work out where it is stuck.
> >
> 
> To verify which has a bug, try to another approaches,
> Could you replace 2.6.20 OneNAND driver with 2.6.24. or vice versa, If
> the problem is same, it's OneNAND bug.

You could also use git-bisect to find exactly which changeset introduced
the problem. But first show us the results of SysRq-P and SysRq-T which
might give some clue where it's hanging.

-- 
dwmw2
