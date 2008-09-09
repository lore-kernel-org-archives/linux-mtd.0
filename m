Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kd79N-0007RX-0Z
	for linux-mtd@lists.infradead.org; Tue, 09 Sep 2008 17:37:13 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kd79J-0007E5-Rt
	for linux-mtd@lists.infradead.org; Tue, 09 Sep 2008 17:37:09 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2008 17:37:09 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2008 17:37:09 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
Date: Tue, 09 Sep 2008 19:14:42 +0200
Message-ID: <lyzlmh8cn1.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lybpyxa1x8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<C4EBF2A9.11917%gerickson@nuovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
Cc: gerickson@nuovations.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Grant Erickson <gerickson@nuovations.com> writes:

>>> +static const char *mtd_device, *img;
>> 
>> would it be possible to split this into two declarations?  I
>> really don't know if 'img' points to a constant or non-constant
>> char...
>
> As currently implemented, both mtd_device and img point to
> effectively read-only information. That is, there is no need to
> modify or to attempt to modify what they point to.

Sorry, I might be unclear here. My comment was about readability
not about correctness; e.g. without studying C standard, it is
not obvious to me, whether

| char const *a, *b;

means

| char const *a;
| char const *b;

or

| char const *a;
| char *b;


When you think that answer to this question is trivial, then
please explain 'char * const *a, *b;' ;)


>>> -int main(int argc, char **argv)
>>> +int main(int argc, char * const argv[])
>> 
>> Is this really correct?  C standard mentions only
>> 
>>                int main(void) { /* ... */ }
>>                int main(int argc, char *argv[]) { /* ... */ }
>> 
>> as program entry points.  I suggest to cast 'argv' to a corresponding
>> data type when it is used.
>
> Those are certainly the two most common prototypes for main. However,
> because main has no prototype

Compiler knows about the two possible prototypes. Perhaps next gcc
version or another compiler (icc) complains about the non-standard
main().


> adding the const qualifier simply conveys current program
> intent. That is, the strings pointed to by argv are not
> modified.

Then, you can write

| int main(int argc, char const * const argv[])

;)


fwiw, the const'ness if argv[] content is violated when calling
GNU getopt(3) as it reorders arguments.  E.g.

| argv[] = { "foo", "-a", "bar", "-c", NULL }

is changed by this function to

| argv[] = { "foo", "-a", "-c", "bar", NULL }



Enrico
