Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PvZBq-0003G4-Ll
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2011 17:53:23 +0000
Message-ID: <4D71270E.9030204@lambsys.com>
Date: Fri, 04 Mar 2011 11:53:18 -0600
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Bug in mtd_speedtest?
References: <4D70280E.8030501@lambsys.com> <1299221982.2735.7.camel@localhost>
In-Reply-To: <1299221982.2735.7.camel@localhost>
Content-Type: multipart/mixed; boundary="------------040908020203060701010206"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040908020203060701010206
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Artem,
     Please find attached patch.

Regards,

Dave.

On 03/04/2011 12:59 AM, Artem Bityutskiy wrote:
> On Thu, 2011-03-03 at 17:45 -0600, David Lambert wrote:
>> I think I may have found an overflow condition in the speed calculation
>> of mtd_speedtest on some platforms with larger flash partitions:
>>
>> Consider for example if goodebcnt = 15000, and mtd->erasesize =
>> 256*1024, then there is an intermediate product of  3932160000 which
>> results in the sign bit being set on a 32 bit integer. Maybe k should be
>> an unsigned long long?
> Please, just send a patch :-)
>


--------------040908020203060701010206
Content-Type: text/plain;
 name="patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch"

SW5kZXg6IG10ZF9zcGVlZHRlc3QuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClJDUyBmaWxlOiAvaG9tZS9j
dnNyb290L0VDTUIvc3JjL3NuYXBnZWFyL2xpbnV4LTIuNi4zMC4xLngvZHJpdmVycy9tdGQv
dGVzdHMvbXRkX3NwZWVkdGVzdC5jLHYKcmV0cmlldmluZyByZXZpc2lvbiAxLjEuMS4xCmRp
ZmYgLXUgLXIxLjEuMS4xIG10ZF9zcGVlZHRlc3QuYwotLS0gbXRkX3NwZWVkdGVzdC5jCTEw
IEF1ZyAyMDA5IDE5OjQyOjAwIC0wMDAwCTEuMS4xLjEKKysrIG10ZF9zcGVlZHRlc3QuYwk0
IE1hciAyMDExIDE3OjUxOjIzIC0wMDAwCkBAIC0yODEsMTMgKzI4MSwxNCBAQAogCiBzdGF0
aWMgbG9uZyBjYWxjX3NwZWVkKHZvaWQpCiB7Ci0JbG9uZyBtcywgaywgc3BlZWQ7CisJdWlu
dDY0X3QgazsKKwlsb25nIG1zOwogCi0JbXMgPSAoZmluaXNoLnR2X3NlYyAtIHN0YXJ0LnR2
X3NlYykgKiAxMDAwICsKLQkgICAgIChmaW5pc2gudHZfdXNlYyAtIHN0YXJ0LnR2X3VzZWMp
IC8gMTAwMDsKLQlrID0gZ29vZGViY250ICogbXRkLT5lcmFzZXNpemUgLyAxMDI0OwotCXNw
ZWVkID0gKGsgKiAxMDAwKSAvIG1zOwotCXJldHVybiBzcGVlZDsKKwltcyA9IChmaW5pc2gu
dHZfc2VjIC0gc3RhcnQudHZfc2VjKSAqIDEwMDAgKyAvKiBUaW1lIGluIG1pbGxpLXNlY29u
ZHMgZnJvbSBzdGFydCB0byAuLi4qLworCSAgICAgKGZpbmlzaC50dl91c2VjIC0gc3RhcnQu
dHZfdXNlYykgLyAxMDAwOwkgIC8qIGZpbmlzaCAqLworCWsgPSAoZ29vZGViY250ICogKG10
ZC0+ZXJhc2VzaXplIC8gMTAyNCkgKiAxMDAwKTsgLyogTnVtYmVyIG9mIGtCeXRlcyB0cmFu
c2ZlcnJlZCAqIDEwMDAgKi8KKwlkb19kaXYoaywgbXMpOwkgIC8qIGsgbm93IGNvbnRhaW5z
IG51bWJlciBvZiBrQnl0ZXMvc2Vjb25kICovCisJcmV0dXJuIGs7CiB9CiAKIHN0YXRpYyBp
bnQgc2Nhbl9mb3JfYmFkX2VyYXNlYmxvY2tzKHZvaWQpCg==
--------------040908020203060701010206--
